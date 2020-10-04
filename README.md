# Unity package template

This is a template repository for creating new repositories for upm (Unity Package Manager) packages.

## Usage

1. Create a new repository using this template
2. Clone the new repository
3. Run RUNME.sh (cautiously!) with bash at new repository root folder and follow instructions, if using windows [Git for Windows](https://gitforwindows.org/) provides bash and all necessary tools.
4. Move all files (expect folders .git/ .github/ and Samples/) inside any Unity Project Assets folder. This will generate .meta files that are required by Unity. 
5. Move files back to the original folder

**Notes:**
- RUNME.sh just helps replacing all tags etc. `{{REPOSITORY_NAME}}` or `{{DESCRIPTION}}` from files, if not familiar with bash scripts this step should be done manually 
- Brief introduction on how to develop your Unity package is included in CONTRIBUTING.md

For further details, please see
 - [Github docs on creating repository from template](https://docs.github.com/en/free-pro-team@latest/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template)
 - [Unity docs on creating custom packages.](https://docs.unity3d.com/Manual/CustomPackages.html)
