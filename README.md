# 📚 Obsidian メモ管理システム

## 🌟 概要
このリポジトリは、ObsidianとCursorを組み合わせた効率的なメモ管理システムです。Zettelkasten方式を採用し、GitHubを利用してデスクトップとモバイル間の同期を行い、AWSのS3を使用して画像を管理します。

## 📂 構成

```
.
├── Zettelkasten/         # Zettelkasten方式のノート管理フォルダ
│   ├── FleetingNote/     # 一時的な思考やアイデアの記録
│   ├── IndexNote/        # 目次や索引として機能するノート
│   ├── LiteratureNote/   # 参考資料や文献からの情報をまとめたノート
│   ├── PermanentNote/    # 最上位の保存用ノート
│   └── Zettelkastenの運用/ # Zettelkasten方式の運用に関するノート
├── Daily/                # 日々のメモを記録するフォルダ
├── MEMO(Thino)/          # ふと思ったことを記録するフォルダ
└── Template/             # テンプレートファイルを格納するフォルダ
```

## 🔧 使用技術・プラグイン
- **Obsidian**: Markdown形式のファイルを扱うメモアプリ
- **obsidian-git**: GitHubリポジトリとの連携・同期
- **s3-image-uploader**: 画像をAWS S3に自動アップロード
- **Kindle Highlights**: Kindleでハイライトした内容をObsidianに取り込み
- **Obsidian_to_Anki**: ObsidianのノートをAnkiのフラッシュカードとして同期
- **Obsidian Web Clipper**: WebページをObsidianに保存するChrome拡張機能
- **Cursor**: エディタ

## 🚀 運用方法
### 📝 Web上の記事をまとめる
1. Obsidian Web Clipperで記事を保存
2. Cursor Composer Agentでまとめる

### 📖 Kindleのハイライトをまとめる
1. Kindle Highlightsプラグインでハイライトを抽出
2. Cursorを使用してまとめノートを作成

### 🧠 Ankiとの連携
1. Obsidian上でAnki用のデッキを作成
2. Obsidian_to_Ankiプラグインで同期

## ⚠️ 注意点
- デスクトップとモバイルで同時に編集を行うと競合が発生する可能性があります
- 画像はS3に保存することでモバイル同期時のタイムアウト問題を回避します

## 📚 参考文献
- [メモ管理は Obsidian in Cursor が最強](https://note.com/shotovim/n/na1d91f10c1d0)

===

# 📚 Obsidian Note Management System

## 🌟 Overview
This repository is an efficient note management system combining Obsidian and Cursor. It adopts the Zettelkasten method, uses GitHub for synchronization between desktop and mobile, and leverages AWS S3 for image management.

## 📂 Structure

```
.
├── Zettelkasten/         # Zettelkasten method note management folder
│   ├── FleetingNote/     # Quick capture of thoughts and ideas
│   ├── IndexNote/        # Table of contents and indexes
│   ├── LiteratureNote/   # Information summarized from references
│   ├── PermanentNote/    # Top-level storage notes
│   └── Zettelkastenの運用/ # Guide for Zettelkasten operation
├── Daily/                # Daily notes recording folder
├── MEMO(Thino)/          # Quick thoughts recording folder
└── Template/             # Template files storage folder
```

## 🔧 Technologies & Plugins
- **Obsidian**: Markdown-based note-taking app
- **obsidian-git**: GitHub repository integration and synchronization
- **s3-image-uploader**: Automatic image uploading to AWS S3
- **Kindle Highlights**: Import highlighted content from Kindle to Obsidian
- **Obsidian_to_Anki**: Synchronize Obsidian notes as Anki flashcards
- **Obsidian Web Clipper**: Chrome extension for saving webpages to Obsidian
- **Cursor**: Editor

## 🚀 Usage Methods
### 📝 Summarizing Web Articles
1. Save articles using Obsidian Web Clipper
2. Summarize with Cursor Composer Agent

### 📖 Organizing Kindle Highlights
1. Extract highlights using Kindle Highlights plugin
2. Create summary notes using Cursor

### 🧠 Anki Integration
1. Create Anki decks in Obsidian
2. Synchronize using Obsidian_to_Anki plugin

## ⚠️ Important Notes
- Conflicts may occur when editing simultaneously on desktop and mobile
- Store images in S3 to avoid timeout issues during mobile synchronization

## 📚 References
- [メモ管理は Obsidian in Cursor が最強](https://note.com/shotovim/n/na1d91f10c1d0)