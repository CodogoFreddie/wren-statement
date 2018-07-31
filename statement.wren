import "eventful" for Event, EventListener

class Statement is EventListener {
  children { [] }

  construct new(){ 
    super()
  }

  dispatch(ev){
    super(ev)

    for(child in this.children){
      child.dispatch(ev)
    }
  }
}
