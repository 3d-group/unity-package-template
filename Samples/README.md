# Samples

This folder can be used to store example projects etc.
This folder is ignored for NPM in [.npmignore file](../.npmignore).

# Running package tests

You can store sample project here to run your packages tests on,
since Unity does not provide standalone package testing solution.

1. Create new Unity project
2. Import your package in manifest.json and mark it as testable:
```json
{
  "dependencies": {
    "com.{{COMPANY}}.{{REPOSITORY_NAME}}": "https://github.com/{{COMPANY}}/{{REPOSITORY_NAME}}.git"
  },
  "testables": [ "com.{{COMPANY}}.{{REPOSITORY_NAME}}" ]
}
```
