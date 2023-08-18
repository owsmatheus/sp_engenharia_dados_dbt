{#
Crie um código SQL
Adicione o código a uma macro sem argumentos
Parametrize a macro com argumentos
Defina valores padrões para os argumentos (quando necessário)
Remova espaços em branco
#}
{% macro limit_lines_dev(environment='dev') %}
    {%- if environment == 'dev'-%}
        limit 5
    {%- endif -%}
{% endmacro %}