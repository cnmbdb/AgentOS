# AgentOS 开发指令

## 产品边界

AgentOS 是多租户 AI Agent SaaS。MVP 优先解决“创建 Agent、接入 Telegram/Web、知识库、工具调用”四个闭环，不提前建设大而全的低代码编辑器或插件市场。

## 架构原则

1. TypeScript 负责 SaaS 控制面与渠道网关。
2. Python 服务负责 Agent 编排、模型适配与检索增强。
3. 所有外部动作必须通过显式 Tool 接口执行。
4. 密钥不得写入数据库明文、日志或仓库。
5. 所有数据查询必须带 tenant_id 隔离条件。
6. API、事件和数据库变更优先向后兼容。
7. 新模块需包含最小测试与运行说明。

## 目录职责

- `apps/web`: 管理后台与用户前端。
- `apps/api`: 身份、租户、Agent 配置、计费、渠道管理。
- `services/agent-engine`: 会话执行、模型路由、RAG、工具选择。
- `packages/channel-sdk`: Telegram、Web Chat 等渠道适配协议。
- `packages/plugin-sdk`: 插件清单、权限、输入输出 Schema。
- `packages/shared`: 跨服务类型、错误码与事件定义。

## MVP 非目标

- Kubernetes
- 自研可视化工作流引擎
- 任意代码插件执行
- 多地区部署
- 完整模板/插件交易市场
