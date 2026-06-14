# 📻 EngelMobile — 80s Hi-Fi Stereo Web Radio

**Versão:** 3.0 | **Desenvolvido por:** EngelMobile desde 1997  
*Sistemas e Apps Personalizados — [engelmobile.netlify.app](https://engelmobile.netlify.app)*

---

## 🌟 Sobre o Projeto

O **80s Hi-Fi Stereo** é um aplicativo de rádios globais com uma interface nostálgica, imersiva e hiper-realista de um autêntico Toca-Fitas (Cassette Deck) dos anos 80. Combina a **Radio Browser API** com design **skeuomorphic** detalhado — texturas de metal escovado, parafusos, luzes LED, VU meters analógicos e teclas mecânicas.

Ele está disponível como um Web App através do Netlify e também como um Aplicativo Android nativo na Google Play Store.

---

## ✨ Funcionalidades

### 🌍 Busca Global de Rádios
- Integração com a **Radio Browser API** (acervo global, acesso gratuito)
- Filtros por **País** e **Gênero/Tag**
- Resultados em modal flutuante, sem quebrar o layout do aparelho

### ⭐ Sistema de Favoritos
- Salvar rádios com o botão ★
- Persistência via **`localStorage`**

### 📼 Compartimento de Fita Interativo (Eject 3D)
- Bobinas giram durante a reprodução (`animation: spin`).
- Luz traseira âmbar acende ao tocar.
- Nome da rádio escrito em fonte manuscrita (`Kalam`) na etiqueta.
- Mecanismo de Ejeção 3D ao clicar na fita, parando o áudio imediatamente.

### 🎛️ Painel de Áudio
- VU Meters em tempo real via **Web Audio API** (`AnalyserNode`).
- Sensibilidade ajustável: **LOW / MID / HIGH**.
- Teclas mecânicas **PLAY**, **STOP** e **FECHAR** (encerra completamente o aplicativo).

---

## 🛠️ Tecnologias Utilizadas

| Tecnologia | Uso |
|-----------|-----|
| **HTML5 / CSS3 Vanilla** | Estrutura, skeuomorphism, gradientes, animações |
| **JavaScript ES6** | Lógica de áudio, APIs, favoritos, DOM |
| **Capacitor (Ionic)** | Conversão do código Web para Aplicativo Android Nativo (.aab) |
| **Google AdMob** | Monetização via banners de rodapé no aplicativo Android |
| **Netlify** | Hospedagem rápida da versão Web do rádio |

> ⚠️ **Nenhuma biblioteca CSS ou framework JS externo** é utilizado na interface Web. Todo o visual é construído puramente com CSS3 Vanilla.

---

## 📂 Estrutura de Arquivos Principal

```
radio/
├── index.html               # App completo (Interface, Áudio e AdMob)
├── privacy.html             # Política de Privacidade (obrigatório para Play Store)
├── deploy_netlify.bat       # Script para empacotar a pasta OUT/ para envio ao Netlify
├── capacitor.config.ts      # Configuração do Capacitor (App ID: com.engelmobile.radio)
├── engelmobile.keystore     # Chave digital de assinatura Android (NÃO DELETAR!)
├── recurso_grafico_*.png    # Imagens geradas para a ficha da loja
├── OUT/                     # Pasta compilada (gerada pelo .bat para o Netlify e Appflow)
└── android/                 # Projeto nativo Android gerado pelo Capacitor
```

---

## 🚀 Como Compilar e Atualizar

### 1. Atualizando a Versão Web (Netlify)
Sempre que fizer alterações no código (ex: `index.html`), você deve empacotar a versão Web para o servidor:
1. Dê dois cliques no arquivo `deploy_netlify.bat`.
2. Ele apagará e recriará a pasta `OUT/` com os arquivos mais recentes (incluindo `privacy.html`).
3. Faça login no [Netlify](https://app.netlify.com), abra o site **`engelradiomobile.netlify.app`** e arraste a pasta `OUT/` para a aba de deploys.

### 2. Sincronizando com o GitHub
O repositório oficial que alimenta o sistema do Ionic Appflow deve ser sempre atualizado.
Abra o terminal na pasta do projeto e digite:
```bash
git add .
git commit -m "Sua mensagem de atualizacao"
git push
```

### 3. Atualizando o Aplicativo Android (Ionic Appflow -> Google Play)
1. Certifique-se de ter empacotado a pasta `OUT/` e enviado as mudanças para o GitHub.
2. Acesse o **[Ionic Appflow](https://ionic.io/appflow)**.
3. No painel do seu projeto, vá em **Builds** e crie um novo build `Android -> Release`.
4. Ele usará o `engelmobile.keystore` para assinar o aplicativo.
5. Faça o download do arquivo **`.aab`** gerado.
6. Vá ao **[Google Play Console](https://play.google.com/console)**, crie uma Nova Versão em *Produção* e envie o novo arquivo `.aab`.

---

## 💰 Monetização (Google AdMob)

O aplicativo está monetizado oficialmente com o Google AdMob.

- **App ID (Android Manifest):** O ID da conta (começa com `~`) está registrado nativamente dentro de `android/app/src/main/AndroidManifest.xml` na tag `<meta-data>`.
- **Ad Unit ID (Banner):** O Bloco de Anúncio de Rodapé (começa com `/`) está registrado dentro do `index.html` na função `AdMob.showBanner()`.
- **Modo Produção:** O parâmetro `isTesting` está definido como `false` para garantir a exibição de anúncios reais geradores de receita.

---

**Desenvolvido por:** EngelMobile desde 1997  
*Sistemas e Apps Personalizados.*  
📞 (51) 99740-3703 | [engelmobile.netlify.app](https://engelmobile.netlify.app)
