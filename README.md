# AgentOS

AgentOS 是一个面向开发者、站长与企业的 AI Agent 业务自动化平台。它将 AI Agent、渠道机器人、知识库、工具调用和工作流整合到统一控制台中。

## 第一阶段目标

- 创建和管理 AI Agent
- 接入 Telegram 与 Web Chat
- 支持多模型供应商
- 提供基础知识库与检索
- 提供安全的工具调用机制
- 对接 n8n 工作流

## 仓库结构

```text
apps/
  web/                  管理控制台
  api/                  SaaS 业务 API
services/
  agent-engine/         Agent 编排与执行引擎
packages/
  shared/               通用类型与工具
  channel-sdk/          渠道适配器 SDK
  plugin-sdk/           Agent 工具/插件 SDK
infra/                  Docker 与本地基础设施
docs/                   产品、架构和决策文档
```

## 本地启动

当前仓库处于立项骨架阶段，尚未安装框架依赖。

```bash
corepack enable
pnpm install
pnpm dev
```

## 关键文档

- [项目章程](docs/PROJECT_CHARTER.md)
- [系统架构](docs/ARCHITECTURE.md)
- [MVP 范围](docs/MVP.md)
- [开发约定](AGENTS.md)

## GitHub

预期远程仓库：`https://github.com/cnmbdb/AgentOS.git`
