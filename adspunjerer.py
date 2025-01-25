from dataclasses import dataclass
import random


@dataclass
class Adspunjerer:
    img_filepath_str: str = "assets/images/sponge0001.png"  # todo :: update sponge

    hit_points: int = 10  # sensible
    base_attack_power: float = 5.0
    spunjelity: float = 3.5  # todo :: tuning
    spunjelity_bonus_roll_n: int = 20  # it's like DnD?

    def get_spunj(self):
        return self.spunjelity + random.randint(self.spunjelity_bonus_roll_n) + 1

    def get_attack_power(self):
        return self.base_attack_power * (1 + self.get_spunj() * 0.1)
