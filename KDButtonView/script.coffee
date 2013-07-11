button = new KDButtonView
  title: "Notify"
  loader:
    color: "#444"
    diameter: 12
  callback: ->
    new KDNotificationView
      title : "Hello World!"

    KD.utils.wait 200, =>
      button.hideLoader()

previewView.addSubView button
