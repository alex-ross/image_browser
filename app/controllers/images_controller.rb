class ImagesController < UICollectionViewController
  attr_accessor :image_urls
  # In app_delegate.rb or wherever you use this controller, just call .new like so:
  #   @window.rootViewController = ImagesController.new
  #
  # Or if you're adding using it in a navigation controller, do this
  #  main_controller = ImagesController.new
  #  @window.rootViewController = UINavigationController.alloc.initWithRootViewController(main_controller)

  IMAGES_CELL_ID = "ImagesCell"

  def self.new(args = {})
    # Set layout
    layout = UICollectionViewFlowLayout.alloc.init
    self.alloc.initWithCollectionViewLayout(layout)
  end

  def viewDidLoad
    super

    rmq.stylesheet = ImagesControllerStylesheet

    collectionView.tap do |cv|
      cv.registerClass(ImagesCell, forCellWithReuseIdentifier: IMAGES_CELL_ID)
      cv.delegate = self
      cv.dataSource = self
      cv.allowsSelection = true
      cv.allowsMultipleSelection = false
      rmq(cv).apply_style :collection_view
    end
  end

  def numberOfSectionsInCollectionView(view)
    1
  end

  def collectionView(view, numberOfItemsInSection: section)
    (image_urls || []).count
  end

  def collectionView(view, cellForItemAtIndexPath: index_path)
    view.dequeueReusableCellWithReuseIdentifier(IMAGES_CELL_ID, forIndexPath: index_path).tap do |cell|
      rmq.build(cell) unless cell.reused

      # Update cell's data here
      cell.update(image_urls[index_path.row])
    end
  end

  def collectionView(view, didSelectItemAtIndexPath: index_path)
    cell = view.cellForItemAtIndexPath(index_path)
    puts "Selected at section: #{index_path.section}, row: #{index_path.row}"
  end

end
