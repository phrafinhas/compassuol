*** Settings ***

Resource    dynamics.robot
Resource    login_keywords.robot
Resource    produtos_keywords.robot
Library     OperatingSystem

*** Keywords ***

POST Endpoint /carrinhos
    &{header}             Create Dictionary    Authorization=${TOKEN_AUTH_ATUAL}
    &{produto}            Create Dictionary    idProduto=${ID_PRODUTO_ATUAL}    quantidade=1
    ${produto_dict}       Set Variable         ${produto}
    @{lista_produtos}     Create List          ${produto_dict}
    &{BODY}               Create Dictionary    produtos=${lista_produtos}
    ${response}           POST On Session      Serverest    ${ENDPOINT_CARRINHOS}    json=${BODY}    headers=${header}
    Set Global Variable   ${response}
    Log To Console        Carrinho: ${response.json()["message"]}
    Log To Console        Produto: ${BODY}
    ${id_carrinho}=       Set Variable         ${response.json()["_id"]}
    Set Global Variable   ${ID_CARRINHO_ATUAL}    ${id_carrinho}
    Log To Console        ID do usuário atual: ${ID_CARRINHO_ATUAL}

GET Endpoint /carrinhos
    ${response}           GET On Session       Serverest    ${ENDPOINT_CARRINHOS}
    Set Global Variable   ${response}
    Log To Console        Response body: ${response.content}

GET Endpoint buscar/carrinhos
    ${response}           GET On Session       Serverest    ${ENDPOINT_CARRINHOS}/${ID_CARRINHO_ATUAL}
    Set Global Variable   ${response}
    Log To Console        Response body: ${response.content}

DELETE Endpoint cancelar-compra/carrinhos
    &{header}=            Create Dictionary    Authorization=${TOKEN_AUTH_ATUAL}
    ${response}           DELETE On Session    Serverest    ${ENDPOINT_CARRINHOS}/cancelar-compra
    ...                   headers=${header}
    Set Global Variable   ${response}
    Log To Console        Resposta: ${response.json()}
