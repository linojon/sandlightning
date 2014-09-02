if Forums.find().count() == 0
  Forums.insert(
    title: 'Linowes/Alinsky Family Summer Vacation, Cape Cod'
    date: '7/4/2014'
  )


if Talks.find().count() == 0
  forum = Forums.findOne()
  Talks.insert(
    title: 'How to Bake French Bread'
    author: 'Jonathan Linowes'
    url: 'https://www.youtube.com/watch?v=fuSBd--tWic&list=UUosefxhmoTG7P14ucUqHLrQ'
    forumId: forum._id
  )
  Talks.insert(
    title: 'A Message to My Grandchildren'
    author: 'Dorothy Linowes'
    url: 'https://www.youtube.com/watch?v=9ts3ojDRxiU&list=UUosefxhmoTG7P14ucUqHLrQ'
    forumId: forum._id
  )
  Talks.insert(
    title: 'Dynamic Positioning of Unmanned Underwater Vehicles (UUVS)'
    author: 'Jarrett Linowes'
    url: 'https://www.youtube.com/watch?v=wedmXbAjt8c&list=UUosefxhmoTG7P14ucUqHLrQ'
    forumId: forum._id
  )