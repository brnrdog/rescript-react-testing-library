include DomTestingLibrary

type queries
type reactComponent
type renderResult = Js.Dict.t<{"container": Dom.element}>

type options = {
  "baseElement": Js.undefined<Dom.element>,
  "container": Js.undefined<Dom.element>,
  "hydrate": Js.undefined<bool>,
  "queries": Js.undefined<queries>,
  "wrapper": Js.undefined<Dom.element>,
}

@module("@testing-library/react")
external _render: (React.element, ~options: options) => renderResult = "render"
let render = (~baseElement=?, ~container=?, ~hydrate=?, ~wrapper=?, ~queries=?, element) => {
  let options = {
    "baseElement": baseElement->Js.Undefined.fromOption,
    "container": container->Js.Undefined.fromOption,
    "hydrate": hydrate->Js.Undefined.fromOption,
    "wrapper": wrapper->Js.Undefined.fromOption,
    "queries": queries->Js.Undefined.fromOption,
  }

  element->_render(~options)
}

let renderElement = (~baseElement=?, ~container=?, ~hydrate=?, ~wrapper=?, ~queries=?, element) => {
  let options = {
    "baseElement": baseElement->Js.Undefined.fromOption,
    "container": container->Js.Undefined.fromOption,
    "hydrate": hydrate->Js.Undefined.fromOption,
    "wrapper": wrapper->Js.Undefined.fromOption,
    "queries": queries->Js.Undefined.fromOption,
  }

  element->_render(~options)->Js.Dict.get("container")
}
