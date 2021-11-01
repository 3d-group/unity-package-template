[![npm package](https://img.shields.io/npm/v/com.3d-group.unity-package-template)](https://www.npmjs.com/package/com.3d-group.unity-package-template)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

# Unity package template

This is a template repository for creating new repositories for upm (Unity Package Manager) packages.

Generated repository will contain:
- Basis for [Unity package](https://docs.unity3d.com/Manual/CustomPackages.html) (package.json, folder structure, assembly definitions etc.)
- Basis for Runtime & Editor tests (can be run straight away after script has ran and package is in some Unity projects assets folder / marked as testable)
- Sample/ExampleUnityProject - empty Unity project for running automated github tests via [unity-ci](https://unity-ci.com/docs)
  - **Note:** Better way for doing this would be appreciated, there is an [issue about this in unity-test-runner](https://github.com/webbertakken/unity-test-runner/issues/71)
- package.json to publish into npm
- Automated github action workflows to run tests on push (further documentation can be found in templates/.github/workflows)
- Automated github action [workflow to publish into npmjs](templates/.github/workflows/on-release.yml) on publish release
  - **Note:** If your package contains a lot of images/data or size exceeds 10mbs it might better to just publish into upm package manager / other service that is meant for storing assets and other big data. It is a good practice to check npm registry guidelines before usage.
- Example [package.json](templates/package.json) 
- Example [README.md](templates/README.md)
- Example [CONTRIBUTING.md](templates/CONTRIBUTING.md), based on [Contributor Covenant](https://www.contributor-covenant.org)
- Example [License](templates/License) (MIT)
- Example [CODEOWNERS](templates/.github/CODEOWNERS), for further details please see [github docs on CODEOWNERS](https://docs.github.com/en/free-pro-team@latest/github/creating-cloning-and-archiving-repositories/about-code-owners)

**Note:** By default this repository is meant for creating open source packages. If creating closed source it might be a good idea to change license and go through generated package.json files etc.

## Usage

1. Create a new repository using this template
2. Clone the new repository
3. Run RUNME.sh (cautiously!) with bash at new repository root folder and follow instructions, if using windows [Git for Windows](https://gitforwindows.org/) provides bash and all necessary tools.
4. Move all files (except folders .git/ .github/ and Samples/) inside any Unity Project Assets folder. This will generate .meta files that are required by Unity. 
5. Move files back to the original folder

**Notes:**
- RUNME.sh just helps replacing all tags etc. `{{REPOSITORY_NAME}}` or `{{DESCRIPTION}}` from files, if not familiar with bash scripts this step should be done manually 
- Brief introduction on how to develop your Unity package is included in CONTRIBUTING.md

For further details, please see
 - [Github docs on creating repository from template](https://docs.github.com/en/free-pro-team@latest/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template)
 - [Unity docs on creating custom packages.](https://docs.unity3d.com/Manual/CustomPackages.html)

When your package is ready for publish, you can publish it into:
- Open Source Unity Package Registry [openupm](https://openupm.com/)
- [npmjs](https://docs.npmjs.com/cli/publish) package registry
  - **Note:** If your package contains a lot of images/data or size exceeds 10mbs it might not be a good idea.

## License

MIT License

Copyright © 2020 3D Group
