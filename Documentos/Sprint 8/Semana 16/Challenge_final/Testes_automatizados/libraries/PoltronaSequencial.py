class PoltronaSequencial:
    def __init__(self):
        self.fileira_atual = 'A'
        self.assento_atual = 1

    def gerar_locator(self):
        locator = (
            f'xpath=//button[contains(@class,"seat") '
            f'and contains(@title,"Fileira {self.fileira_atual}") '
            f'and contains(@title,"Assento {self.assento_atual}")]'
        )

        # Atualiza para próxima execução
        self.assento_atual += 1
        if self.assento_atual > 10:
            self.assento_atual = 1
            self.fileira_atual = chr(ord(self.fileira_atual) + 1)

        return locator