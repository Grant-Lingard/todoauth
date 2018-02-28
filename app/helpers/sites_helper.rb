module SitesHelper
    def title(page_title, show_title=true)
        content_for(:title) { page_title.to_s }
        @show_title = show_title 
    end 
    
    #Don't use this. This works with Material
    def nav_link(text,path)
        if current_page?(path)
            link_to(text,path, class: ["nav-item","nav-link","active"])
        else
            link_to(text,path, class: ["nav-item","nav-link"])
        end
    end
    
    #Use this example for Bootstrap only.
    #def nav_link(text,path)
    #   if current_page?(path) 
    #       content_tag :li, class: 'nav-item active' do
    #           link_to(path, class: 'nav-link') do
    #               sanitize(text) + content_tag(:span, "(current)", class: "sr-only") 
    #           end
    #       end 
    #    else 
    #        content_tag :li, class: 'nav-item' do
    #            link_to(text, path, class: 'nav-link') 
    #        end   
    #    end
    #end

end
