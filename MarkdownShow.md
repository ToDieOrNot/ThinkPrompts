#网文小说开头SVG生成器
- 创建时间：2024.10.20
- 创建作者：李书生

##目标
创建一个引人注目的SVG图像，展示用户提供的网文小说开头（100字左右），并通过视觉设计增强其吸引力。
##用户输入
[在此处粘贴用户提供的100字左右的小说开头]
##SVG生成步骤
1. 分析文本内容：
- 识别故事的主题和风格（如武侠、科幻、奇幻等）
- 提取关键词和重要句子
- 确定故事的核心元素（如特定物品、场景或动作）
2. 设计整体布局：
- 画布尺寸：480x760像素
- 背景颜色：黑色(#000000)
3. 创建标题：
- 位置：顶部居中（y坐标约80）
- 字体：KingHwa_OldSong 或其他适合的衬线字体
- 主标题大小：40px，副标题（如有）：20px
- 颜色：浅灰色(#e0e0e0)
- 添加轻微的发光效果
4. 添加分隔线：
- 位置：标题下方（y坐标约140）
- 颜色：深灰色(#4a4a4a)
5. 排版正文内容：
- 使用<foreignObject>元素来支持富文本格式
- 字体：KingHwa_OldSong，大小18px，行高1.8
- 基本文字颜色：浅灰色(#e0e0e0)
- 对齐方式：两端对齐
- 段落缩进：2em
6. 突出关键内容：
- 选择一个突出颜色（如金色#ffd700）
- 用突出颜色标记关键词、短语或句子
- 可以适当增加字重或大小来进一步强调
7. 设计装饰元素：
- 基于故事主题创建2-3个相关的图形元素
- 位置：页面下方（y坐标约620）
- 使用简单的几何形状和线条
- 颜色方案与文字保持一致（主要使用浅灰色和突出颜色）
8. 添加点缀效果：
- 在页面底部添加简单的装饰线条
- 使用渐变或微妙的纹理增添深度
9. 确保可读性：
- 保持足够的对比度
- 避免文字和装饰元素重叠
10. 优化SVG代码：
- 使用语义化的组件命名
- 移除任何不必要的元素或属性
- 确保SVG结构清晰，便于后续编辑
## 输出格式
生成的SVG应包含在<antArtifact>标签内，使用以下格式：
```
<ANTARTIFACTLINKidentifier="[为设计起一个独特的标识符]"type="image/svg+xml"title="[为设计起一个描述性标题]"isClosed="true"/>
```
## 注意事项
- 严格遵守双色设计原则，除了背景黑色外，只使用两种主要颜色
- 确保设计风格与故事内容和氛围相匹配
- 平衡视觉吸引力和可读性，文字内容应始终是焦点
- 装饰元素应该增强主题，而不是分散注意力>