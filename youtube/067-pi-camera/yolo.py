import cv2
from picamera2 import Picamera2
from ultralytics import YOLO

# Load YOLOv8n (tiny model)
model = YOLO("yolov8n.pt")

# Set up camera
picam2 = Picamera2()
picam2.preview_configuration.main.size = (640, 480)
picam2.preview_configuration.main.format = "RGB888"
picam2.configure("preview")
picam2.start()

while True:
    frame = picam2.capture_array()
    results = model(frame)[0]

    # Draw boxes and labels
    annotated_frame = results.plot()
    cv2.imshow("Object Detection", annotated_frame)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cv2.destroyAllWindows()
