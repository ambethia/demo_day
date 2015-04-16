ActiveAdmin::Views::TableFor.class_eval do

  def img_column(col_sym=:img, title="Image")
    column title, sortable: false do |obj|
      url = obj.send("#{col_sym}_url", :tiny)
      link_to(image_tag(url, width: 50, height: 50), url)
    end
  end

end

# You can also subclass this and do `index as: MyIndexAsTableSubclass` to get the same functionality
ActiveAdmin::Views::IndexAsTable.class_eval do
  def default_table
    proc do
      selectable_column
      id_column
      resource_class.content_columns.each do |col|
        if col.name.ends_with? "img"
          img_column col.name.to_sym
        else
          column col.name.to_sym
        end
      end
      actions
    end
  end
end

ActiveAdmin::Views::AttributesTable.class_eval do
  def content_for(record, attr)
    previous = current_arbre_element.to_s

    if attr.to_s.ends_with? "img"
      value = find_attr_value(record, attr)
      img_url = record.send("#{attr}_url", :thumb)
      value = link_to(image_tag(img_url), img_url)
    else
      value = pretty_format find_attr_value(record, attr)
    end

    value.blank? && previous == current_arbre_element.to_s ? empty_value : value
  end
end

class FilepickerForActiveAdminInput
  include Formtastic::Inputs::Base
  def to_html
    input_wrapping do
      label_html <<
      builder.file_field(method, input_html_options)
    end
  end
end

ActiveAdmin::FormBuilder.class_eval do

  protected

  def default_input_type(method, options = {})
    if column = column_for(method) and column.type == :string
      if method.to_s.ends_with? "img"
        return :filepicker_for_active_admin
      end
    end
    super
  end

end
