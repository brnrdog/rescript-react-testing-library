open Jest
open Expect
open ReactTestingLibrary

module Dummy = {
  @react.component
  let make = () => {
    <div> {React.string("Hello World")} </div>
  }
}

test("render", () => {
  <Dummy />->render |> expect |> toMatchSnapshot
})
