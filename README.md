# Revista Porto Alegre — Manual de uso

Site: <https://italoalves93.github.io/revpoa/>  
Repositório: <https://github.com/italoalves93/revpoa>

O site é gerado pelo **Jekyll** e publicado automaticamente pelo GitHub Actions toda vez que um `push` é feito para o branch `main`. O tempo entre o push e a publicação é de aproximadamente 1–2 minutos.

---

## Estrutura do repositório

```
revpoa/
├── _posts/           ← textos da revista (.md ou .html)
├── _data/
│   └── autores.yml   ← cadastro de autores
├── assets/
│   └── YYYY/MM/      ← imagens, organizadas por ano e mês
├── _layouts/         ← templates de página (não editar)
├── _sass/            ← estilos (não editar)
├── sobre.md          ← página "Sobre"
├── expediente.md     ← página "Expediente"
├── _data/menu.yml    ← itens do menu de navegação
└── _config.yml       ← configurações gerais do site
```

---

## Publicar um texto novo

### 1. Criar o arquivo

Crie um arquivo em `_posts/` com o nome no formato:

```
AAAA-MM-DD-slug-do-titulo.md
```

O **slug** é o título em minúsculas, sem acentos, com hífens no lugar de espaços. Ele vira a URL final do post.

Exemplos:
```
_posts/2024-03-15-o-fim-da-modernidade.md
_posts/2024-03-15-resenha-de-um-livro.md
```

### 2. Cabeçalho (front matter)

Todo post começa com um bloco YAML entre `---`. Copie e adapte:

```yaml
---
layout: post
title: 'Título do texto'
date: 2024-03-15
author: slug-do-autor
blurb: "Chamada curta do texto. Aparece na página inicial e nas redes sociais."
permalink: /slug-do-titulo/
---
```

| Campo | Obrigatório | Descrição |
|---|---|---|
| `layout` | sim | Sempre `post` para artigos, ensaios e resenhas |
| `title` | sim | Use aspas simples se o título tiver dois-pontos ou vírgulas |
| `date` | sim | Formato `AAAA-MM-DD` |
| `author` | sim | Slug do autor conforme cadastrado em `_data/autores.yml` |
| `permalink` | sim | URL final, no formato `/slug/` |
| `blurb` | recomendado | Use sempre aspas duplas; aspas simples no interior não precisam de escape |
| `image` | opcional | Caminho para imagem de capa (`/assets/2024/03/imagem.jpg`). Se omitido, o sistema usa a primeira imagem do texto como thumbnail nas redes sociais |

#### Dois ou mais autores

Substitua `author:` por `authors:` com uma lista de slugs:

```yaml
authors: [alex-da-rosa, sara-de-araujo-pessoa]
```

### 3. Conteúdo em Markdown

O conteúdo começa logo após o fechamento `---` do front matter.

---

## Sintaxe Markdown

### Parágrafos

Texto separado por uma linha em branco vira parágrafos distintos:

```markdown
Primeiro parágrafo.

Segundo parágrafo.
```

### Títulos

```markdown
## Subtítulo de seção

### Subtítulo de subseção
```

### Ênfase

```markdown
_itálico_  ou  *itálico*

**negrito**

**_negrito e itálico_**
```

### Links

```markdown
[texto do link](https://exemplo.com)
```

### Citação em bloco

```markdown
> Texto citado.
> Pode ter múltiplas linhas.
```

### Listas

```markdown
- Item um
- Item dois
- Item três

1. Primeiro
2. Segundo
3. Terceiro
```

### Notas de rodapé

```markdown
Texto com nota de rodapé.[^1] Outra nota aqui.[^2]

[^1]: Texto da primeira nota.
[^2]: SOBRENOME, Nome. *Título do livro*. Editora, Ano, p. 00.
```

As notas aparecem automaticamente formatadas no final do post, com link de retorno.

### Separador de seção simples

```markdown
---
```

---

## Elementos que precisam de HTML

Alguns recursos visuais do site não têm equivalente em Markdown puro. Insira as tags HTML diretamente no arquivo `.md` — o Jekyll processa os dois formatos juntos sem problema.

---

### Capitular (primeira letra ampliada)

```html
<p class="has-drop-cap">Primeiro parágrafo do texto, com a letra inicial ampliada...</p>
```

---

### Separador estilizado com três pontos

```html
<hr class="wp-block-separator is-style-dots">
```

---

### Imagem com legenda

O Markdown padrão (`![alt](src)`) não suporta legendas. Use:

```html
<figure>
  <img src="{{ site.baseurl }}/assets/2024/03/minha-imagem.jpg" alt="Descrição da imagem">
  <figcaption>Legenda da imagem. © Crédito fotográfico</figcaption>
</figure>
```

> **Importante:** sempre use `{{ site.baseurl }}/assets/...` no caminho — nunca `assets/...` sem esse prefixo, pois quebra em páginas internas.

#### Variante: imagem full-width

```html
<figure class="wp-block-image alignfull">
  <img src="{{ site.baseurl }}/assets/2024/03/imagem.jpg" alt="Descrição">
  <figcaption>Legenda © Crédito</figcaption>
</figure>
```

#### Variante: imagem centralizada

```html
<figure class="aligncenter">
  <img src="{{ site.baseurl }}/assets/2024/03/imagem.jpg" alt="Descrição">
  <figcaption>Legenda</figcaption>
</figure>
```

---

### Bloco de referência bibliográfica (resenhas)

Coloque logo após o front matter, antes do texto. Exibe o livro resenhado em destaque visual:

```html
<div class="referencia-block">
  <div>
    <p><em>Título do Livro</em>, Nome Autor (Editora, Ano), XXX pp.</p>
  </div>
</div>
```

---

### Citação em bloco no estilo do site

O `>` do Markdown funciona, mas para o estilo visual exato:

```html
<blockquote class="wp-block-quote">
  <p>Texto da citação.</p>
  <cite>— Autor da citação</cite>
</blockquote>
```

---

### Bio do autor ao final do texto

Convenção usada nos posts da revista:

```html
<hr class="wp-block-separator is-style-dots">

<p><strong>Nome do Autor</strong> é doutor em Filosofia pela UFRGS e pesquisa...</p>
```

---

## Exemplo completo de post em Markdown

```markdown
---
layout: post
title: 'O fim da modernidade: notas sobre o presente'
date: 2024-03-15
author: caroline-schmidt
blurb: "Uma leitura do colapso das grandes narrativas a partir do cotidiano periférico."
permalink: /o-fim-da-modernidade/
---

<figure class="wp-block-image alignfull">
  <img src="{{ site.baseurl }}/assets/2024/03/capa.jpg" alt="Imagem de capa">
  <figcaption>Título da obra. © Nome do fotógrafo</figcaption>
</figure>

<p class="has-drop-cap">Primeiro parágrafo do texto, com a letra capitular. O Jekyll
processa HTML inline junto com Markdown sem nenhum problema.</p>

O segundo parágrafo já é Markdown puro. Pode usar _itálico_, **negrito**,
[links](https://exemplo.com) e notas de rodapé.[^1]

## Uma seção do texto

Mais conteúdo aqui.

> Uma citação relevante que merece destaque.

<hr class="wp-block-separator is-style-dots">

Último parágrafo antes da bio.

<hr class="wp-block-separator is-style-dots">

<p><strong>Caroline Schmidt</strong> é estudante de História da Arte na UFRGS.</p>

[^1]: SOBRENOME, Nome. *Título*. Editora, Ano, p. 00.
```

---

## Imagens

### Onde colocar

Imagens ficam em `assets/AAAA/MM/`, seguindo o ano e mês da publicação:

```
assets/2024/03/minha-imagem.jpg
```

### Formatos e tamanhos recomendados

| Tipo | Formato | Largura máx. | Peso máx. |
|---|---|---|---|
| Fotos | JPEG (qualidade 80–85%) | 1200 px | 500 KB |
| Capturas de tela / gráficos | PNG | 1200 px | 500 KB |
| Imagem de capa social | JPEG | 1200 × 630 px | 300 KB |

---

## Autores

### Cadastrar autor novo

Abra `_data/autores.yml` e adicione em ordem alfabética pelo slug:

```yaml
nome-sobrenome:
  nome: "Nome Completo com Acentos"
  bio: "Breve biografia. Aparece na página de autoria."
```

O slug deve ser o nome em minúsculas, sem acentos, com hífens:

| Nome | Slug |
|---|---|
| Caroline Schmidt | `caroline-schmidt` |
| Fredric Jameson | `fredric-jameson` |
| György Lukács | `gyorgy-lukacs` |

---

## Páginas fixas (Sobre, Expediente)

Edite os arquivos Markdown na raiz do repositório:

```markdown
---
layout: page
title: Sobre
permalink: /sobre/
---

Conteúdo em Markdown aqui.
```

---

## Menu de navegação

Edite `_data/menu.yml`:

```yaml
- title: Início
  url: /
- title: Sobre
  url: /sobre/
- title: Expediente
  url: /expediente/
```

---

## Fluxo completo de publicação

```
1. Escrever o texto
2. Preparar e redimensionar as imagens
3. Copiar imagens para assets/AAAA/MM/
4. Criar _posts/AAAA-MM-DD-slug.md com front matter correto
5. Verificar: o slug do autor existe em _data/autores.yml?
6. git add _posts/... assets/...
   git commit -m "Publica: Título do texto"
   git push origin main
7. Aguardar ~1 min → texto no ar
```

---

## Armadilhas frequentes

**Post não aparece no site**  
→ Confirme que o nome do arquivo segue o padrão `AAAA-MM-DD-slug.md` e que o front matter abre e fecha com `---` em linhas próprias.

**Imagem aparece com ponto de interrogação**  
→ Verifique se o `src` usa `{{ site.baseurl }}/assets/...` e se o arquivo existe exatamente nesse caminho (atenção a maiúsculas/minúsculas e acentos no nome do arquivo).

**Autor aparece como slug em vez do nome**  
→ O slug no campo `author:` não bate com nenhuma chave em `_data/autores.yml`. Confira a ortografia.

**`blurb` com aspas simples no texto quebra o YAML**  
→ Declare o blurb sempre entre aspas duplas: `blurb: "O autor diz que 'isso' é importante."`.

**Título com dois-pontos quebra o YAML**  
→ Envolva em aspas simples: `title: 'Software Negro: entre revolução e repressão'`.
