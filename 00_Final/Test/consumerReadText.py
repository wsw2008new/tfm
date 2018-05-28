from kafka import SimpleConsumer, SimpleClient
from kafka import KafkaConsumer
from kafka import KafkaClient

group_name = "my-group"
topic_name = "streamKafka"

kafka = KafkaClient('kafka1:9092')
#consumer = SimpleConsumer(kafka, group_name, topic_name)

consumer2 = KafkaConsumer(topic_name, bootstrap_servers='kafka1:9092', group_id=group_name)

print ("Created consumer for group:"+ group_name + " and topic: " + topic_name + "")
print("Waiting for messages...")

for message in consumer2:
	print(message.value)