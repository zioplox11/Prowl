var Message, MessagesView, MessageList;

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
        message.set("other_user_image", "");
        message.set("other_user_name", "");
        message.set("body_sample", "");
        this.$el.append(this.template(message.toJSON()));
      }.bind(this));
      // this.$el.html(this.collection.length); test for sanity
      // this.$el.append(function(){
      // })
    },

    fetchMetaData: function (message){
      var other_user;
      var recipient_id = message.get('recipient_id');
      var sender_id = message.get('sender_id');
      var user = new User();
      switch (currentuser.get('id')){
        case recipient_id:
          other_user = user.set('id', sender_id);
          break;
        case sender_id:
          other_user = user.set('id', recipient_id);
          break;
      }
      other_user.fetch().complete()
    }
  });

  // $('#main_profile').hide();
  // var inbox = new MessageList();

  // var inboxView = new MessagesView({collection: inbox});

  // inbox.fetch().complete(function(){
  //   inboxView.render();
  // })


});
