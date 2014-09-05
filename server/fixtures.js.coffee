isDevEnv = true

# title, date

if Forums.find().count() == 0
  Forums.insert(
    title: 'Linowes/ Alinsky/ Allen Family Summer Vacation'
    location: 'Cape Cod, Massachusetts'
    date: 'July 4, 2014'
  )

# title, author, yt_url (andor ytId), raw:bool, private:bool, 

if Talks.find().count() == 0
  forum = Forums.findOne()
  breadId = Talks.insert(
    title: 'How to Bake French Bread'
    author: 'Jonathan Linowes'
    ytId: 'fuSBd--tWic' 
    forumId: forum._id
    position: 1
    commentsCount: 1
  )
  Talks.insert(
    title: 'A Short Walk Around the World'
    author: 'David Alinsky'
    ytId: 'Rncx8VP9QuQ'
    forumId: forum._id
    position: 2
    commentsCount: 0
  )
  Talks.insert(
    title: 'My 92 Happy Years Beget Yours'
    author: 'Dorothy Linowes'
    ytId: '9ts3ojDRxiU' 
    forumId: forum._id
    position: 3
    commentsCount: 0
 )
  Talks.insert(
    title: 'Dynamic Positioning of Unmanned Underwater Vehicles (UUVS)'
    author: 'Jarrett Linowes'
    ytId: 'wedmXbAjt8c' 
    forumId: forum._id
    position: 4
    commentsCount: 0
  )
  Talks.insert(
    title: 'Photos of Chicago from My First Year at College'
    author: 'Russell Allen'
    ytId: '56JNR_Z_MuM' 
    forumId: forum._id
    position: 5
    commentsCount: 0
  )
  Talks.insert(
    title: 'Chakras: Energy Centers of Your Body'
    author: 'Gregory Allen'
    ytId: 'lxTSor94vfg' 
    forumId: forum._id
    position: 6
    commentsCount: 0
  )
  Talks.insert(
    title: 'The Proper Way to Sit and Stand'
    author: 'Steven Linowes'
    ytId: 'sq5z2A_UuXw' 
    forumId: forum._id
    position: 7
    commentsCount: 0
  )
  Talks.insert(
    title: "We're Building a Church in Rural Uganda"
    author: 'Irene Nakamya'
    ytId: '_Rz9jO_wqJI' 
    forumId: forum._id
    position: 8
    commentsCount: 0
  )
  Talks.insert(
    title: "Aardvarks!!"
    author: 'Shelby Alinsky'
    ytId: 'cUXdqVYkHLY' 
    forumId: forum._id
    position: 9
    commentsCount: 0
  )
  Talks.insert(
    title: 'How to Change Public Opinion on Major Issues'
    author: 'Lisa Linowes'
    ytId: 'ksNaZ8zhofw' 
    forumId: forum._id
    position: 10
    commentsCount: 0
  )
  Talks.insert(
    title: 'How to Give the Perfect Presentation'
    author: 'Joanne Linowes Alinsky'
    ytId: 'RhLDFuFhrKw' 
    forumId: forum._id
    position: 11
    commentsCount: 0
  )
  Talks.insert(
    title: 'Tap Dancing Demo'
    author: 'Asher Allen'
    ytId: 'SUliUb5_ERY' 
    forumId: forum._id
    position: 12
    commentsCount: 0
  )

  if isDevEnv
    # fake comments
    now = new Date().getTime()
    joeId = Meteor.users.insert(
      profile: { name: 'Joe Example'}
    )
    joe = Meteor.users.findOne joeId

    Comments.insert(
      talkId: breadId
      userId: joeId
      author: joe.profile.name
      submittedAt: now - 5 * 3600 * 1000
      body: 'Very interesting and yummy!'

    )
