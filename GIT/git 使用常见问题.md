# git 使用常见问题 

-  Permission denied 

一般是因为二进制 git 客户端无执行权限，可在本地用下述命令设置权限后提交代码发布
```
chmod -R 0777 ./git
```

- unable to find remote helper for 'https'

请使用 ssh 的方式，不支持 http 的方式，例如：

```
git clone git@github.com:test/test.git
```

- The authenticity of host 'gitlab.alibaba-inc.com' can't be established

在执行 git 操作命令前，通过 GIT_SSH_COMMAND 指定SSH环境变量控制：

```
const gitBin = resolve(this.appDir, './bin/git');
const GITEnv = `GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"`;

execSync(GITEnv + ' ' + gitBin + ` clone ${repoAddress} ${target}`);
```

- SSH 权限问题

可以生成一个专门用于 git 操作的 ssh 密钥对，公钥配置到 gitlab 的 用户 ssh key 中，私钥上传到代码仓库中（例如：项目目录的  bin/private 文件中），执行 git 操作时，指定使用此私钥：

```
const gitBin = resolve(this.appDir, './bin/git');
const privateKeyFile = resolve(this.appDir, './bin/private');
const GITEnv = `GIT_SSH_COMMAND="ssh -i ${privateKeyFile}`;

execSync(GITEnv + ' ' + gitBin + ` clone ${repoAddress} ${target}`);
```

- 私钥密码问题

原因一：私钥存在密码
因此在使用 ssh-keygen 生成秘钥输入密码时，直接按回车，不要输入任何字符：

原因二：生成的不是 RSA 3072