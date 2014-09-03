# title, date

if Forums.find().count() == 0
  Forums.insert(
    title: 'Linowes/Alinsky/Allen Family Summer Vacation'
    location: 'Cape Cod, Massachusetts'
    date: '7/4/2014'
  )

# title, author, yt_url (andor yt_id), raw:bool, private:bool, 

if Talks.find().count() == 0
  forum = Forums.findOne()
  Talks.insert(
    title: 'How to Bake French Bread'
    author: 'Jonathan Linowes'
    yt_id: 'fuSBd--tWic' 
    forumId: forum._id
    position: 1
  )
  Talks.insert(
    title: 'A Short Walk Around the World'
    author: 'David Alinsky'
    yt_id: 'Rncx8VP9QuQ'
    forumId: forum._id
    position: 2
  )
  Talks.insert(
    title: 'A Message to My Grandchildren'
    author: 'Dorothy Linowes'
    yt_id: '9ts3ojDRxiU' 
    forumId: forum._id
    position: 3
 )
  Talks.insert(
    title: 'Dynamic Positioning of Unmanned Underwater Vehicles (UUVS)'
    author: 'Jarrett Linowes'
    yt_id: 'wedmXbAjt8c' 
    forumId: forum._id
    position: 4
  )
  Talks.insert(
    title: 'Photos of Chicago from My First Year at College'
    author: 'Russell Allen'
    yt_id: '56JNR_Z_MuM' 
    forumId: forum._id
    position: 5
  )
  Talks.insert(
    title: 'Chakras: Energy Centers of Your Body'
    author: 'Gregory Allen'
    yt_id: 'lxTSor94vfg' 
    forumId: forum._id
    position: 6
 )
  Talks.insert(
    title: 'The Proper Way to Sit and Stand'
    author: 'Steven Linowes'
    yt_id: 'sq5z2A_UuXw' 
    forumId: forum._id
    position: 7
  )
  Talks.insert(
    title: "I'm Building a Church in Uganda"
    author: 'Irene Naykama'
    yt_id: '_Rz9jO_wqJI' 
    forumId: forum._id
    position: 8
  )
  Talks.insert(
    title: "Aardvarks!!"
    author: 'Shelby Alinsky'
    yt_id: 'cUXdqVYkHLY' 
    forumId: forum._id
    position: 9
  )
  Talks.insert(
    title: 'How to Change Public Opinion on Major Issues'
    author: 'Lisa Linowes'
    yt_id: 'ksNaZ8zhofw' 
    forumId: forum._id
    position: 10
  )
  Talks.insert(
    title: 'How to Give the Perfect Presentation'
    author: 'Joanne Linowes Alinsky'
    yt_id: 'RhLDFuFhrKw' 
    forumId: forum._id
    position: 11
  )
  Talks.insert(
    title: 'Tap Dancing Demo'
    author: 'Asher Allen'
    yt_id: 'SUliUb5_ERY' 
    forumId: forum._id
    position: 12
  )
