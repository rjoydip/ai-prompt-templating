from poml import poml  # type: ignore

output = poml(
    "./templates/main.poml",
    context={},
)

print(output[0]["content"])
