# FrameWorkNavigation-APP



一个优雅的 iOS 应用程序，展示 Apple 各种框架的详细信息。使用 SwiftUI 构建，采用 MVVM 架构模式，展示了现代 iOS 开发的最佳实践。

## 技术亮点

### 1. 现代化 UI 架构
- 使用 SwiftUI 构建响应式用户界面
- 采用 LazyVGrid 实现高效的网格布局
- 支持深色模式（Dark Mode）
- 自适应布局，支持不同尺寸的 iOS 设备

### 2. MVVM 架构设计
```swift
final class FrameworkGridViewModel: ObservableObject {
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    @Published var isShowingDetailView = false
}
```
- 采用 MVVM 架构模式，实现业务逻辑与 UI 的清晰分离
- 使用 `@Published` 属性包装器实现响应式数据流
- 通过 `ObservableObject` 协议实现状态管理

### 3. 优雅的导航系统
```swift
struct FrameworkGridView: View {
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("APPLE 🤡")
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(framework: viewModel.selectedFramework!, 
                                  isShowingDetailView: $viewModel.isShowingDetailView)
            }
        }
    }
}
```
- 使用 `NavigationView` 实现流畅的页面导航
- 采用 `sheet` 模态展示实现优雅的详情页面切换
- 手势驱动的交互设计

### 4. 可复用的组件设计
```swift
struct FrameworkTitleView: View {
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
    }
}
```
- 组件化设计，提高代码复用性
- 使用 `scaledToFit` 和 `minimumScaleFactor` 实现自适应文本大小
- 统一的视觉风格

### 5. 数据模型设计
```swift
struct Framework: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let urlString: String
    let description: String
}
```
- 使用 `Identifiable` 协议优化列表性能
- 采用 `Hashable` 协议支持数据比较
- 清晰的数据结构设计

### 6. 集成 Safari 服务
```swift
struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
}
```
- 使用 `UIViewControllerRepresentable` 桥接 UIKit 组件
- 集成系统 Safari 服务，提供原生浏览体验
- 优雅的 SwiftUI 与 UIKit 混合开发实践

## 项目特点

- 🎨 现代化的 UI 设计
- 📱 响应式布局
- 🔄 MVVM 架构
- 🚀 高性能实现
- 📦 组件化设计
- 🌙 深色模式支持

## 技术栈

- SwiftUI
- MVVM 架构
- Combine 框架
- Swift 5.0+

## 要求

- iOS 13.0+
- Xcode 13.0+
- Swift 5.0+

## 安装

1. 克隆项目
```bash
git clone https://github.com/yourusername/FrameWorkNavigation-APP.git
```

2. 打开项目
```bash
cd FrameWorkNavigation-APP
open FrameWork.xcodeproj
```

3. 运行项目
- 选择目标设备
- 点击运行按钮或按 Cmd+R

## 贡献

欢迎提交 Issue 和 Pull Request！
