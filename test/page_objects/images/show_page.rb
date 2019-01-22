module PageObjects
  module Images
    class ShowPage < PageObjects::Document
      path :image

      collection :tag_elements, locator: '.img-tags', item_locator: '.card__tag'

      def image_url
        # node.find("img[src=\"#{url}\"]")
        node.find('.image')['src']
      end

      def tags
        tag_elements.map(&:text)
        # node.all('.card__tag-link').map(&:text)
      end

      def delete
        node.click_on('Delete')
        yield node.driver.browser.switch_to.alert
      end

      def delete_and_confirm!
        node.click_on('Delete')
        node.driver.browser.switch_to.alert.accept
        window.change_to(IndexPage)
      end

      def go_back_to_index!
        node.click_on('Home')
        window.change_to(IndexPage)
      end
    end
  end
end
