

def game():
    while True:
        action = input("What is your action? ")
        print(
            "Actions are not yet known. You are trapped in the SPUNJ forever,"
            f" even though you tried to {action!r}. Unlucky."
        )


if __name__ == "__main__":
    print(
        """
You are an intrepid adventurer, the SPUNJ.
Your goal is to acquire as many SPUNJ points as possible, to [[[[REDACTED]]]]
"""
    )
    game()
