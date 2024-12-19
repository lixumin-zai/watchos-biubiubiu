import SwiftUI

struct BiuView: View {
    // 用于存储陀螺仪数据的状态变量
    @State private var pitch: Double = 0.0
    @State private var roll: Double = 0.0
    @State private var yaw: Double = 0.0
    
    @State private var resetState: Bool = true
    @State private var status: String = "kacha"
    
    // 创建 WatchMotionDataManager 的实例
    private let motionDataManager = WatchMotionDataManager()
    private let soundManager = SoundManager()
    
    var body: some View {
        VStack {
            // 显示陀螺仪数据
            Text("俯仰角 (Pitch): \(pitch, specifier: "%.2f")")
                .font(.headline)
            Text("横滚角 (Roll): \(roll, specifier: "%.2f")")
                .font(.headline)
            Text("偏航角 (Yaw): \(yaw, specifier: "%.2f")")
                .font(.headline)
            Text(status)
                .font(.headline)
            Spacer()
            
            // 可以使用图标或其他UI元素
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("运动数据")
                .font(.subheadline)
        }
        .padding()
        .onAppear {
            // 当视图出现时开始获取运动数据
            motionDataManager.onMotionUpdate = { pitch, roll, yaw in
                self.pitch = pitch
                self.roll = roll
                self.yaw = yaw
                if self.pitch > -1 && self.roll > -2.0 && self.roll < -0.5 && resetState {
                    soundManager.playbiubiubiu()
                    resetState = false
                    status = "biubiubiu"
                }
                if self.pitch < -1.3 && self.roll > -2.0 && self.roll < -0.5 && !resetState {
                    soundManager.playkaca()
                    resetState = true
                    status = "kacha"
                }
            }
            motionDataManager.startDeviceMotionUpdates()
            
        }
        .onDisappear {
            // 当视图消失时停止获取运动数据
            motionDataManager.stopDeviceMotionUpdates()
        }
    }
}

#Preview {
    BiuView()
}
