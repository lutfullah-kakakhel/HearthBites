from typing import Optional
from uuid import UUID
import logging

logger = logging.getLogger(__name__)


class NotificationService:
    """Service for sending push notifications via FCM."""
    
    def __init__(self, fcm_server_key: Optional[str] = None):
        self.fcm_server_key = fcm_server_key
    
    async def send_order_notification(
        self,
        user_id: UUID,
        title: str,
        body: str,
        data: Optional[dict] = None
    ):
        """Send order-related notification to user."""
        # In MVP, just log to console
        logger.info(f"📱 FCM Notification to {user_id}: {title} - {body}")
        if data:
            logger.info(f"   Data: {data}")
    
    async def send_rider_assignment(self, rider_id: UUID, order_id: UUID):
        """Notify rider of new assignment."""
        await self.send_order_notification(
            rider_id,
            "New Delivery Task",
            f"You have been assigned order {order_id}",
            {"order_id": str(order_id), "type": "assignment"}
        )
    
    async def send_status_update(self, user_id: UUID, order_id: UUID, status: str):
        """Notify user of order status change."""
        await self.send_order_notification(
            user_id,
            "Order Update",
            f"Your order {order_id} is now {status}",
            {"order_id": str(order_id), "status": status}
        )


# Global notification service instance
notification_service = NotificationService()

