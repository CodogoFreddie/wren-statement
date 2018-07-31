import "./statement" for Statement, Event

class TriangularEvent is Event {
  color { _color }
  construct new(color){
    _color = color
  }
}

class QuadelateralEvent is Event {
  flavour { _flavor }
  construct new(flavour){
    _flavor = flavour
  }
}

class FavouriteismEvent is Event{
  favourite { _favourite }
  construct new(favourite){
    _favourite = favourite
  }
}

class Triangle is Statement {
  color { _color }
  favourite { _favourite }
  construct new(){
    super()

    this.addListener(TriangularEvent) { |event| _color = event.color }
    this.addListener(FavouriteismEvent) { |event|
      if(this.type == event.favourite){
        _favourite = true
      } else {
        _favourite = false
      }
    }
  }
}

class Square is Statement {
  flavour { _flavor }
  favourite { _favourite }
  construct new(){
    super()

    this.addListener(QuadelateralEvent) { |event| _flavor = event.flavour }
    this.addListener(FavouriteismEvent) { |event|
      if(this.type == event.favourite){
        _favourite = true
      } else {
        _favourite = false
      }
    }
  }
}

class Shapes is Statement {
  triangle { _triangle }
  square { _square }
  dimensions { _dimensions }
  children { [ _triangle, _square ] }

  construct new(){
    super()

    _triangle = Triangle.new()
    _square = Square.new()
    _dimensions = 2
  }
}

var shapes = Shapes.new()
shapes.dispatch(TriangularEvent.new("red"))
shapes.dispatch(QuadelateralEvent.new("spicy"))
shapes.dispatch(FavouriteismEvent.new(Triangle))

System.print(shapes.triangle.color)
System.print(shapes.square.flavour)
System.print(shapes.triangle.favourite)
System.print(shapes.square.favourite)
