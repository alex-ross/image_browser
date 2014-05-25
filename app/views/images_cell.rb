class ImagesCell < UICollectionViewCell
  attr_reader :reused

  def rmq_build
    rmq(self).apply_style :images_cell

    q = rmq(self.contentView)
    @image = q.append(UIImageView, :image).get
    # Add your subviews, init stuff here
    # @foo = q.append(UILabel, :foo).get
  end

  def prepareForReuse
    @reused = true
  end

  def update(image_url)
    @image.url = image_url
  end
end
