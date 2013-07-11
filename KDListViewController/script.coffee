class MainView extends JView
  constructor:->
    super

    @listController = new KDListViewController
      lastToFirst         : yes
      startWithLazyLoader : yes
      viewOptions         :
        type              : "example-list"
        itemClass         : ExampleItemView

    @listView = @listController.getView()

    @buttons = new KDButtonGroupView
      buttons:
        "Add Item"  :
          callback    : =>
            input = @inputView.getValue()
            @listController.addItem input
            @listController.hideLazyLoader()
            @_notify?.destroy()
            @_notify = new KDNotificationView
              title : "Item added!"
        "Remove Item" :
          callback    : =>
            inputData = @inputView.getValue()
            @listController.removeItem null, inputData, null
            @_notify?.destroy()
            @_notify = new KDNotificationView
              title : "Item removed!"
        "Remove all Items"  :
          callback    : =>
            @listController.removeAllItems()
            @listController.showLazyLoader()
            @_notify?.destroy()
            @_notify = new KDNotificationView
              title : "All items removed"

    @inputView = new KDInputView
      cssClass      : "test-input"
      placeholder   : "Write item name..."

  pistachio:->
    """
    {{> this.inputView}}
    {{> this.buttons}}
    {{> this.listView}}

    """
  viewAppended: ->
    @setTemplate do @pistachio

  class ExampleItemView extends KDListItemView
    constructor: (options, data) ->
      super

    partial: =>
      content = @getData()
      """
      #{content}
      """

previewView.addSubView new MainView
  cssClass: "my-koding-app"
