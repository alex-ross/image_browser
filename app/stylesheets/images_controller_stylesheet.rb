class ImagesControllerStylesheet < ApplicationStylesheet

  include ImagesCellStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb

    @margin = ipad? ? 12 : 8
  end

  def collection_view(st)
    st.view.contentInset = [0, 0, 0, 0]
    st.background_color = color.white

    st.view.collectionViewLayout.tap do |cl|
      cl.itemSize = [cell_size[:w], cell_size[:h]]
      #cl.scrollDirection = UICollectionViewScrollDirectionHorizontal
      #cl.headerReferenceSize = [cell_size[:w], cell_size[:h]]
      cl.minimumInteritemSpacing = 0
      cl.minimumLineSpacing = 0
      #cl.sectionInset = [0,0,0,0]
    end
  end
end