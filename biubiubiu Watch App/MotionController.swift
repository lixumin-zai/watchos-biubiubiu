import CoreMotion
import WatchKit


class WatchMotionDataManager {
    private let motionManager = CMMotionManager()
    private var timer: Timer?
    private let queue = OperationQueue()

    // 用于将数据传递给 ContentView 的闭包
    var onMotionUpdate: ((Double, Double, Double) -> Void)?

    // 启动设备运动更新（使用定时器方式获取数据）
    func startDeviceMotionUpdates() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 1.0 / 30.0
            motionManager.startDeviceMotionUpdates()

            timer = Timer.scheduledTimer(withTimeInterval: 1.0 / 30.0, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                if let deviceMotion = self.motionManager.deviceMotion {
                    let pitch = deviceMotion.attitude.pitch
                    let roll = deviceMotion.attitude.roll
                    let yaw = deviceMotion.attitude.yaw
                    
                    // 通过闭包传递数据
                    self.onMotionUpdate?(pitch, roll, yaw)
                }
            }
            RunLoop.current.add(timer!, forMode: .default)
        } else {
            print("设备运动数据不可用。")
        }
    }

    // 停止设备运动更新
    func stopDeviceMotionUpdates() {
        motionManager.stopDeviceMotionUpdates()
        timer?.invalidate()
        timer = nil
    }
}
