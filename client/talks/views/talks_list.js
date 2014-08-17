var talksData = [
  {
    title: 'How to Bake French Bread',
    author: 'Jonathan Linowes',
    url: 'https://www.youtube.com/watch?v=fuSBd--tWic&list=UUosefxhmoTG7P14ucUqHLrQ'
  },
  {
    title: 'A Message to My Grandchildren',
    author: 'Dorothy Linowes',
    url: 'https://www.youtube.com/watch?v=9ts3ojDRxiU&list=UUosefxhmoTG7P14ucUqHLrQ'
  },
  {
    title: 'Dynamic Positioning of Unmanned Underwater Vehicles (UUVS)',
    author: 'Jarrett Linowes',
    url: 'https://www.youtube.com/watch?v=wedmXbAjt8c&list=UUosefxhmoTG7P14ucUqHLrQ'
  }
];
Template.talksList.helpers({
  talks: talksData
});