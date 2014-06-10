// var Message, MessagesView, MessageList, inbox, inboxView;


$(function(){

  Message = Backbone.Model.extend({});

  MessageList = Backbone.Collection.extend({
    url: '/messages',
    model: Message
  });

  MessagesView = Backbone.View.extend({
    el: $('#main_inbox'),

    className: 'inbox',

    template: _.template(JST['templates/message_view']),

    render: function(){
      this.$el.empty();
      this.collection.each(function(message,idx){
        var message_user = this.fetchMetaData(message);
      }.bind(this));
    },

    fetchMetaData: function (message){
      var recipient_id = message.get('recipient_id');
      var sender_id = message.get('sender_id');
      var message_user = new User();
      var user_id = parseInt(currentUser.get('id'));
      switch (user_id) {
        case recipient_id:
          message_user.set('id', sender_id);
          break;
        case sender_id:
          message_user.set('id', recipient_id);
          break;
      }
      var view = this;
      message_user.fetch().complete(function(){
        var messageObj = {
          username: message_user.get('username'),
          profile_image_url: message_user.get('profile_image_url'),
          body: message.get('body'),
          created_at: message.get('created_at')
        }
        view.$el.append(view.template(messageObj));
      });
    }
  });

  // inbox = new MessageList();

  // inboxView = new MessagesView({collection: inbox});

  // inbox.fetch().complete(function(){
  //   inboxView.render();
  // });

});
