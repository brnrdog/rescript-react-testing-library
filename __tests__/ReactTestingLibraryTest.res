open Jest
open Expect
open ReactTestingLibrary

// Make it pipe-first:
let toMatchSnapshot = a => a |> Expect.toMatchSnapshot

module Dummy = {
  @react.component
  let make = () => {
    <div>
      <label> {React.string("Choose a color")} </label>
      <select>
        <option> {React.string("Red")} </option>
        <option> {React.string("Green")} </option>
        <option> {React.string("Blue")} </option>
      </select>
    </div>
  }
}

let setup = () => {
  renderElement(<Dummy />)
}

test("render red option", () => {
  setup()
  ->getByRole(~matcher=#Str("option"), ~options=makeByRoleOptions(~name="Red", ()))
  ->expect
  ->toMatchSnapshot
})

test("render red option", () => {
  setup()
  ->getByRole(~matcher=#Str("option"), ~options=makeByRoleOptions(~name="Green", ()))
  ->expect
  ->toMatchSnapshot
})

test("render red option", () => {
  setup()
  ->getByRole(~matcher=#Str("option"), ~options=makeByRoleOptions(~name="Blue", ()))
  ->expect
  ->toMatchSnapshot
})
