from jinja2 import Environment, FileSystemLoader, select_autoescape  # type: ignore

env = Environment(
    loader=FileSystemLoader("templates"),
    autoescape=select_autoescape(["html", "xml"]),
    trim_blocks=True,
    lstrip_blocks=True,
)


def generate_prompt_with_context(**context):
    template = env.get_template("main.j2")
    return template.render(**context)


if __name__ == "__main__":
    instructions = [
        {
            "index": "01",
            "steps": [
                "Hello, from article 1!",
                "This is additional step for article 1",
            ],
        },
        {
            "index": "03",
            "steps": [
                "Hello, from article 3!",
                "This is additional step for article 3",
            ],
        },
        {
            "index": "04",
            "steps": [
                "Hello, from article 4!",
                "This is additional step for article 4",
            ],
        },
    ]

    prompt_with_context = generate_prompt_with_context(
        user_name="Alice",
        instructions=instructions,
        additional_constraint="Keep response under 100 words.",
    )
    print("=" * 50)
    print(prompt_with_context)
    print("=" * 50)
