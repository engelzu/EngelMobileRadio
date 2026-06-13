# 📻 EngelMobile — 80s Hi-Fi Stereo Web Radio

**Versão:** 3.0 | **Desenvolvido por:** EngelMobile desde 1997  
*Sistemas e Apps Personalizados — [engelmobile.netlify.app](https://engelmobile.netlify.app)*

---

## 🌟 Sobre o Projeto

O **80s Hi-Fi Stereo** é um aplicativo Web de rádios globais com uma interface nostálgica, imersiva e hiper-realista de um autêntico Toca-Fitas (Cassette Deck) dos anos 80. Combina a **Radio Browser API** com design **skeuomorphic** detalhado — texturas de metal escovado, parafusos, luzes LED, VU meters analógicos e teclas mecânicas.

---

## 🎨 Padrões de Design (Design System)

Estas são as regras de design que **devem ser seguidas** em qualquer alteração ou adição de elementos ao app:

### Paleta de Cores

| Token | Valor | Uso |
|-------|-------|-----|
| `--amber` | `#ffb300` | Cor principal — textos, LEDs, destaques |
| `--amber-dark` | `#e67e22` | Gradiente secundário de âmbar |
| `--metal-dark` | `#111` / `#222` | Fundo de painéis, controles |
| `--metal-frame` | `#444 → #222 → #111` | Gradiente do chassis principal |
| `--gold-light` | `#f9d976` | Tom claro do metal dourado |
| `--gold-mid` | `#e9b646` | Tom médio do metal dourado |
| `--gold-dark` | `#b8860b` | Tom escuro do metal dourado |
| `--screw-dark` | `#5c4300` | Borda inferior dos elementos dourados |
| `--text-dark` | `#1a1a1a` / `#111` | Texto sobre superfícies douradas |

### Textura de Aço Escovado (Brushed Metal)

Todo botão, tecla ou placa dourada usa obrigatoriamente:

```css
background:
    repeating-linear-gradient(
        90deg,
        transparent, transparent 1px,
        rgba(255,255,255,0.15) 1px, rgba(255,255,255,0.15) 2px
    ),
    linear-gradient(135deg, #f9d976 0%, #e9b646 25%, #f9d976 50%, #b8860b 75%, #f9d976 100%);
```

### Bordas 3D (Relevo Físico)

Todos os elementos elevados usam bordas assimétricas para simular iluminação física:

```css
border-top:    1px solid #fff;       /* Luz no topo */
border-left:   1px solid #fff5cc;    /* Luz na esquerda */
border-bottom: 1px solid #5c4300;    /* Sombra na base */
border-right:  1px solid #5c4300;    /* Sombra na direita */
```

### Sombra Interna (Inset Box-Shadow)

```css
box-shadow: 0 4px 6px rgba(0,0,0,0.8),
            inset 0 1px 2px rgba(255,255,255,0.9),
            inset 0 -2px 3px rgba(0,0,0,0.5);
```

### Efeito de Clique Físico (Tecla Mecânica)

```css
/* Estado normal */
transform: none;

/* Ao pressionar (:active) */
transform: translateY(4px);
box-shadow: 0 1px 2px rgba(0,0,0,0.9),
            inset 0 1px 2px rgba(255,255,255,0.4),
            inset 0 -1px 2px rgba(0,0,0,0.8);
border-top: 1px solid #a87900;
```

### Tipografia

| Elemento | Fonte | Peso | Estilo |
|----------|-------|------|--------|
| Chassis / Botões | `Arial`, `Arial Black` | `bold` / `900` | `uppercase`, `letter-spacing: 2-4px` |
| Placa ENGELMOBILE | `Arial Black` | `900` | `italic`, `uppercase`, `letter-spacing: 4px` |
| Nome da Rádio (fita) | `Kalam` (Google Fonts) | `700` | Manuscrito, cor azul escuro |
| Labels âmbar | `Arial` | `bold` | `uppercase`, `letter-spacing: 1.5px` |

### Cor Âmbar (Running / Labels ativos)

```css
color: #ffb300;
```

---

## 🔩 Regras de Componentes

### Botões (Teclas Mecânicas)
- Usar `border-radius: 2px 2px 4px 4px` (cantos levemente arredondados na base)
- Obrigatório ter textura de aço escovado + bordas 3D
- Texto em `color: #111` com `text-shadow: 1px 1px 0px rgba(255,255,255,0.5)`
- Efeito de afundar com `translateY(4px)` no `:active`

### VU Meters
- `border-radius: 12px` (mesmo que a fita cassete)
- `overflow: hidden` para respeitar os cantos arredondados
- Fundo âmbar com `radial-gradient` simulando luz traseira
- Agulha vermelha (`#ff0000`) com `transform-origin: bottom center`
- Labels **L** e **R** centralizados horizontalmente, posicionados a `top: 90%` do meter
- Efeito de vidro acrílico via `::after` com `z-index: 3`

### Placa ENGELMOBILE
- Textura de aço escovado dourado (mesmo padrão dos botões)
- Parafusos de fenda nos cantos (via `::before` e `::after`)
- Parafusos inclinados 30° — `transform: translateY(-50%) rotate(30deg)`
- Subtítulo em `font-style: italic`, tamanho menor, cor `#222`

### Parafusos de Fenda
```css
background:
    linear-gradient(to right, transparent 45%, #111 45%, #111 55%, transparent 55%),
    /* + textura escovada + gradiente dourado */;
border-radius: 50%;
transform: translateY(-50%) rotate(30deg);
```

### Cor dos Parafusos
- Mesma textura dourada da placa (`#f9d976 → #b8860b`)

---

## ✨ Funcionalidades

### 🌍 Busca Global de Rádios
- Integração com a **Radio Browser API** (acervo global, acesso gratuito)
- Filtros por **País** e **Gênero/Tag**
- Resultados em modal flutuante, sem quebrar o layout do aparelho

### ⭐ Sistema de Favoritos
- Salvar rádios com o botão ★
- Persistência via **`localStorage`** (não requer instalação do app)
- Favoritos permanecem após fechar o browser, mas não sincronizam entre dispositivos
- Perdidos apenas se o usuário limpar os dados do site manualmente

### 📼 Compartimento de Fita Interativo (Eject 3D)
- Bobinas giram durante a reprodução (`animation: spin`).
- Luz traseira âmbar acende ao tocar.
- Nome da rádio escrito em fonte manuscrita (`Kalam`) na etiqueta.
- **Mecanismo de Ejeção 3D:** Ao clicar sobre a fita cassete, ela se inclina para a frente em perspectiva 3D realista, parando imediatamente a reprodução da música (se ativa).
- **Fechamento Automático:** Ao selecionar qualquer rádio ou clicar em `PLAY`, o compartimento fecha-se automaticamente de volta ao chassis antes do áudio iniciar.
- **Proteção Antiatitap (Anti-Click-Through):** Inclui temporizador de segurança de 400ms para evitar cliques indesejados (cliques fantasmas em telas de toque) após fechar painéis ou selecionar rádios.

### 🎛️ Painel de Áudio
- VU Meters em tempo real via **Web Audio API** (`AnalyserNode`).
- Sensibilidade ajustável: **LOW / MID / HIGH**.
- Chave 3D **LOW VOL** (reduz volume a 30%).
- Teclas mecânicas **PLAY**, **STOP** e **FECHAR** (encerra completamente o aplicativo e o áudio em segundo plano, seja nativamente via Capacitor no Android ou no navegador Web).

### 🏷️ Rótulo Estético Personalizado (KTE)
- Logotipo oficial **KTE** desenhado nativamente em vetor SVG transparente de alta definição (círculo com cores do Google e monograma "EM" centralizado).
- Design 100% livre de bordas brancas ou caixas opacas, mesclando-se com o fundo do adesivo da fita.
- Subtítulo de alta fidelidade alterado para `- HIGH FIDELITY` no lado inferior direito da fita.
- Mensagem padrão de repouso alterada para `SELECIONE OU SINTONIZAR ABAIXO` quando o toca-fitas estiver desligado ou parado.

### 📱 PWA (Progressive Web App)
- `manifest.json` + `sw.js` (Service Worker) para instalação nativa
- Botão **INSTALAR APP** aparece automaticamente quando disponível (evento `beforeinstallprompt`)
- Funciona offline após instalação (assets em cache pelo Service Worker)

---

## 🛠️ Tecnologias Utilizadas

| Tecnologia | Uso |
|-----------|-----|
| **HTML5** | Estrutura semântica |
| **CSS3 Vanilla** | Skeuomorphism, gradientes, glassmorphism, animações |
| **JavaScript ES6** | Lógica de áudio, API, favoritos, DOM |
| **Web Audio API** | Análise de frequência para os VU meters |
| **Radio Browser API** | Banco de dados global de rádios |
| **localStorage** | Persistência de favoritos |
| **PWA / Service Worker** | Instalação e funcionamento offline |
| **Google Fonts (Kalam)** | Tipografia manuscrita da etiqueta da fita |

> ⚠️ **Nenhuma biblioteca CSS ou framework JS externo** é utilizado. Todo o visual é construído puramente com CSS3 Vanilla.

---

## 📂 Estrutura de Arquivos

```
radio/
├── index.html      # App completo (HTML + CSS + JS em arquivo único)
├── manifest.json   # Configuração PWA
├── sw.js           # Service Worker (cache offline)
├── icone.png       # Ícone do app
├── gerar_icones.html  # Utilitário para gerar ícones Play Store
└── README.md       # Este arquivo
```

---

## 🚀 Como Usar

1. Abra `index.html` no navegador **ou** acesse pelo link publicado
2. Selecione um **País** e um **Gênero** nos filtros
3. Clique em **SINTONIZAR** para buscar rádios
4. Escolha uma estação na lista
5. Pressione **PLAY** para ouvir
6. Clique em ★ para salvar nos favoritos
7. Acesse suas rádios salvas pelo botão **FAVORITOS ⭐**

---

## 📦 Publicação na Play Store — via Capacitor (Ionic)

Este app é convertido para Android usando **[Capacitor](https://capacitorjs.com)** (Ionic), que envolve o HTML/CSS/JS em um container nativo Android, gerando um `.aab` oficial para a Google Play Store.

### Por que Capacitor?
- ✅ Open source e gratuito
- ✅ Gera app Android nativo real (não WebView genérica)
- ✅ Acesso a APIs nativas (câmera, notificações, etc.) se necessário
- ✅ Compatível com compilação na nuvem (Ionic Appflow) e Play Console

### Geração do APK/AAB na Nuvem (Ionic Appflow)

Este processo utiliza a plataforma **Ionic Appflow** para gerar o arquivo final na nuvem, eliminando a necessidade de instalar o pesado Android Studio no seu computador.

#### Passo 1: Preparação do Projeto (Localmente)
Mesmo compilando na nuvem, precisamos gerar a configuração do Capacitor localmente. Abra o terminal na pasta do projeto e copie/cole estes comandos:

```bash
npm init -y
npm install @capacitor/core @capacitor/cli @capacitor/android
npm install @capacitor-community/admob
npx cap init "EngelMobile Radio" "com.engelmobile.radio" --web-dir .
npx cap add android
npx cap sync
```

**Configurando o AdMob Manualmente:**
1. No arquivo `index.html`, localize a função `showRealAdMobBanner()`, troque o seu `adId` real e mude `isTesting: true` para `isTesting: false`.
2. Abra o arquivo gerado em `android/app/src/main/AndroidManifest.xml` (com o Bloco de Notas) e adicione seu **App ID real** antes do final da tag `</application>`:
   ```xml
   <meta-data android:name="com.google.android.gms.ads.APPLICATION_ID" android:value="COLE_AQUI_SEU_APP_ID_REAL"/>
   ```

#### Passo 2: Envio do Código para o GitHub
O Ionic Appflow compila aplicativos lendo diretamente do seu repositório de código.
1. Crie uma conta gratuita no [GitHub](https://github.com/).
2. Crie um repositório e faça o envio (*push*) de todos os arquivos da pasta do rádio (incluindo a recém-criada pasta `android/`) para o GitHub.

#### Passo 3: Compilação no Ionic Appflow
1. Acesse o **[Ionic Appflow](https://ionic.io/appflow)** e acesse o painel.
2. Conecte sua conta do GitHub e importe o repositório do seu rádio.
3. No menu esquerdo, vá em **Builds** (ou **Commits**).
4. Selecione a plataforma **Android** e escolha o tipo de build **Release**.
5. O Appflow vai pedir o upload da sua chave de assinatura de segurança (Keystore). Se você ainda não tem uma, pode gerá-la usando utilitários simples de linha de comando ou sites confiáveis.
6. Inicie o processo! O servidor da Ionic fará todo o trabalho e liberará um botão para baixar o seu arquivo **`.aab`**.

Envie o arquivo `.aab` final baixado diretamente para o painel do **Google Play Console**!

### Requisitos antes de compilar
- [ ] Node.js instalado (apenas para rodar os comandos iniciais localmente)
- [ ] Código fonte armazenado no GitHub
- [ ] Conta no Ionic Appflow criada
- [ ] Chave de Assinatura (Keystore) do Android para upload na nuvem
- [ ] Ícones em todos os tamanhos na pasta `icons/` (use `gerar_icones.html`)
- [ ] Screenshot da tela salvo como `screenshot_mobile.png` (necessário para a loja)
- [ ] Painel do AdMob criado com ID pronto

### Configuração do `capacitor.config.json` recomendada

```json
{
  "appId": "com.engelmobile.radio",
  "appName": "EngelMobile Radio",
  "webDir": ".",
  "server": {
    "androidScheme": "https"
  }
}
```

---

**Desenvolvido por:** EngelMobile desde 1997  
*Sistemas e Apps Personalizados.*  
📞 (51) 99740-3703 | [engelmobile.netlify.app](https://engelmobile.netlify.app)
