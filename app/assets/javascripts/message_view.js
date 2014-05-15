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
        debugger;
        message.set("other_user_image", "");
        message.set("other_user_name", "");
        message.set("body_sample", "");
        this.$el.append(this.template(message.toJSON()));
      }.bind(this));
      // this.$el.html(this.collection.length); test for sanity
      // this.$el.append(function(){

      // })
    }
  });

  $('#main_profile').hide();
  var inbox = new MessageList();

  var inboxView = new MessagesView({collection: inbox});

  inbox.fetch().complete(function(){
    inboxView.render();
  })


});
