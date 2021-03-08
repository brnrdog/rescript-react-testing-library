# ReScript React Testing Library

[![npm](https://img.shields.io/npm/v/rescript-react-testing-library?label=version&style=flat-square)](https://www.npmjs.com/package/rescript-react-testing-library)
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/brnrdog/rescript-react-testing-library/Release?style=flat-square)](https://github.com/brnrdog/rescript-react-testing-library/actions/workflows/release.yml)
![Codecov](https://img.shields.io/codecov/c/github/brnrdog/rescript-react-testing-library?style=flat-square)

ReScript bindings for [testing-library/react](https://github.com/testing-library/react-testing-library/).

## Install

```bash
npm install --save-dev rescript-react-testing-library
# or yarn
yarn add --dev rescript-react-testing-library
```

Update your bsconfig file:

```json
{
  "bs-dev-dependencies": ["rescript-react-testing-library"]
}
```

## Usage

```res
open Jest
open Expect
open ReactTestingLibrary

// Make it pipe-first:
let toMatchSnapshot = a => a |> Expect.toMatchSnapshot

module DummyComponent = {
  @react.component
  let make = () => {
    <div>
      <label> {React.string("Choose a color")} </label>
      <select>
        <option> {React.string("Red")} </option>
        <option> {React.string("Green")} </option>
        <option onClick={_ => Js.log("Blue")}> {React.string("Blue")} </option>
      </select>
    </div>
  }
}

describe("DummyComponent", () => {
  beforeEach(() => {
    <DummyComponent />->renderOnScreen
  })

  test("render Red option", () => {
    screen
    ->getByRole(~matcher=#Str("option"), ~options=makeByRoleOptions(~name="Red", ()))
    ->expect
    ->toMatchSnapshot
  })

  test("render Green option", () => {
    screen
    ->getByRole(~matcher=#Str("option"), ~options=makeByRoleOptions(~name="Green", ()))
    ->expect
    ->toMatchSnapshot
  })

  test("render Blue option", () => {
    screen
    ->getByRole(~matcher=#Str("option"), ~options=makeByRoleOptions(~name="Blue", ()))
    ->expect
    ->toMatchSnapshot
  })
})
```
