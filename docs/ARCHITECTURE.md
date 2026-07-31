# AgentOS 系统架构

## 控制面

`apps/web` 提供管理控制台；`apps/api` 管理用户、租户、Agent 配置、渠道凭证、知识库元数据、插件安装和配额。

## 执行面

`services/agent-engine` 接收标准化会话请求，完成模型路由、上下文构建、知识检索、工具决策和响应生成。

## 消息流

```text
Channel Webhook
  -> API / Channel Gateway
  -> normalize message
  -> Agent Engine
  -> model + retrieval + tools
  -> normalized response
  -> Channel Adapter
  -> end user
```

## 数据组件

- PostgreSQL：租户、配置、会话元数据、审计数据
- pgvector：知识库向量
- Redis：缓存、限流、任务队列、短期状态
- 对象存储：用户上传的源文件

## 安全边界

- 渠道令牌和模型密钥采用加密字段或外部 Secret Manager。
- Tool 默认拒绝，需通过插件清单声明权限。
- 高风险写操作应支持确认、幂等键与审计日志。
- 多租户数据必须在 API 与数据库策略两层隔离。

## 初期部署

Docker Compose 运行 PostgreSQL、Redis 和 n8n；应用服务可部署至 Railway、Cloudflare 或独立服务器。MVP 不引入 Kubernetes。
