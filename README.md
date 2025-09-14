# Prompt Template Comparison

This repository demonstrates two different approaches to building dynamic prompt templates in Python: using Jinja2 templating and POML (Prompt Markup Language).

## Project Structure

```bash
├── .gitignore
├── .vscode/
│   └── extensions.json          # VS Code extension recommendations
├── with-jinja2/                 # Jinja2 implementation
│   ├── .python-version
│   ├── README.md
│   ├── main.py                  # Main Jinja2 example
│   ├── pyproject.toml
│   ├── uv.lock
│   └── templates/
│       ├── main.j2              # Main template
│       ├── steps.j2             # Steps template
│       └── instructions/        # Individual instruction templates
│           ├── 01.j2
│           └── 03.j2
└── with-poml/                   # POML implementation
    ├── .python-version
    ├── README.md
    ├── main.py                  # Main POML example
    ├── pyproject.toml
    ├── uv.lock
    └── templates/
        ├── main.poml            # Main POML template
        ├── steps.poml           # Steps POML template
        └── constraints.poml     # Constraints POML template
```

## Features

Both implementations demonstrate:

- **Dynamic prompt generation** with context variables
- **Template composition** using includes/imports
- **Conditional content** rendering
- **Loop-based content** generation for multiple instructions
- **Modular template** organization

## Requirements

- Python 3.13+
- UV package manager (recommended) or pip

## Getting Started

### With Jinja2

Navigate to the `with-jinja2` directory:

```bash
cd with-jinja2
uv sync  # or pip install -e .
python main.py
```

The Jinja2 implementation features:

- Traditional template syntax with `{{ }}` and `{% %}`
- File-based template loading
- Dynamic template inclusion based on instruction indices
- Graceful handling of missing templates

### With POML

Navigate to the `with-poml` directory:

```bash
cd with-poml
uv sync  # or pip install -e .
python main.py
```

The POML implementation features:

- XML-like semantic markup for prompts
- Built-in prompt structure elements (`<role>`, `<task>`, `<stepwise-instructions>`)
- Native support for loops and variables
- Semantic prompt composition

## Example Output

Both implementations generate structured prompts for AI assistants with:

- **Role definition**: "You are a super clever AI assistant"
- **Task specification**: Context-aware task descriptions
- **Stepwise instructions**: Dynamically generated based on article data
- **Constraints**: Simple language requirements
- **Hints**: Additional guidance for the AI

## Key Differences

| Feature | Jinja2 | POML |
|---------|--------|------|
| Syntax | Traditional templating (`{{ }}`, `{% %}`) | XML-like semantic markup |
| Learning curve | Familiar to web developers | New syntax to learn |
| Prompt structure | Manual organization | Built-in semantic elements |
| Template composition | File includes | XML-style includes |
| Variables | Context dictionary | Built-in `<let>` elements |

## VS Code Extensions

The repository includes recommended VS Code extensions:

- `samuelcolvin.jinjahtml` - Jinja2 template support
- `poml-team.poml` - POML language support

## Use Cases

This comparison is useful for:

- **Prompt engineers** evaluating templating approaches
- **AI application developers** building dynamic prompt systems
- **Teams** deciding between traditional templating vs. specialized prompt markup
- **Researchers** studying prompt engineering methodologies

## Contributing

Feel free to:

- Add new template examples
- Improve existing implementations
- Add other templating approaches for comparison
- Enhance documentation

## License

Released under [MIT](./LICENSE) by [@rjoydip](https://github.com/rjoydip).
