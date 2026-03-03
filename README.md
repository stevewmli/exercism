# Exercism Learning

A personal repository for tracking [Exercism](https://exercism.org) exercise solutions and learning progress.

## About Exercism

[Exercism](https://exercism.org) is a free, open-source platform that offers coding exercises in 67+ programming languages with optional mentoring. It's a great way to improve your programming skills through practice.

## Repository Structure

Exercises are organized by programming language:

```
exercism/
├── python/
│   └── hello-world/
│       └── hello_world.py
├── javascript/
│   └── hello-world/
│       └── hello-world.js
└── go/
    └── hello-world/
        └── hello_world.go
```

## Getting Started

1. Install the [Exercism CLI](https://exercism.org/docs/using/solving-exercises/working-locally):
   ```bash
   # macOS
   brew install exercism

   # Linux/Windows
   # Download from https://exercism.org/cli-walkthrough
   ```

2. Configure your workspace:
   ```bash
   exercism configure --token=<your-token> --workspace=<path-to-this-repo>
   ```

3. Download an exercise:
   ```bash
   exercism download --exercise=hello-world --track=python
   ```

4. Solve the exercise, then submit:
   ```bash
   exercism submit python/hello-world/hello_world.py
   ```

## Resources

- [Exercism Documentation](https://exercism.org/docs)
- [Exercism CLI Walkthrough](https://exercism.org/cli-walkthrough)
- [Available Language Tracks](https://exercism.org/tracks)
