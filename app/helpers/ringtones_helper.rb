module RingtonesHelper
    # include ActsAsTaggableOn::TagsHelper

    def has_attachment?(item)
        # binding.pry
        if item.attachment.blank?
            "no"
        else
            image_tag("play_16.png")
        end
    end

    def show_attachment_info(item)
        if item.attachment.blank?
            "attachment not found"
        else 
            item.attachment.file.original_filename
        end
    end

    def show_tag_cloud()
        tags = Ringtone.tag_counts_on(:tags)
        # binding.pry
        tag_links = ""
        tag_cloud(tags, %w(s m l)) do |tag, css_class|
            # binding.pry
            # link_to tag.name, tag_path(tag.name), class: css_class 
            tag_links+=link_to tag.name, tag_path(tag.name), class: css_class 
            tag_links+= ', '
        end
        tag_links
    end
end
