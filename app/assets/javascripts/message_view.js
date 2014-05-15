$(function(){

  var Message, MessagesView, MessageList;

  Message = Backbone.Model.extend({

  });

  MessageList = Backbone.Collection.extend({
    url: '/messages',
    model: Message

  });

  MessagesView = Backbone.View.extend({
    className: 'messages'
  });

});
