class LoaderExample extends JView
  constructor:->
    super
    @button = new KDButtonView
      title: "Start the loader!"
      callback: =>
        @loader.show()
        KD.utils.wait 5000, =>
          @loader.hide()

    @loader = new KDLoaderView
      size          :
        width       : 100
      loaderOptions :
        color       : "#222222"
        shape       : "roundRect"
        diameter    : 16
        density     : 50
        range       : 0.4
        speed       : 1.5
        FPS         : 24

  pistachio:->
    """
    {{> @button}}
    {{> @loader}}
    """
  viewAppended: ->
    @setTemplate do @pistachio

previewView.addSubView new LoaderExample
