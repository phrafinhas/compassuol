*** Variables ***


${clicar_poltrona}    xpath=//button[contains(@class,"seat") and contains(@title,"Fileira B") and contains(@title,"Assento 6")]


${continuar_para_pagamento}=    css=button.btn.btn-primary.checkout-button


${liberar_assentos}=    css=button[title*="Torna todos os assentos disponíveis"]