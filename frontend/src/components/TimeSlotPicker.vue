<template>
  <fieldset class="time-slot-picker">
    <legend class="time-slot-picker__legend">Deadline</legend>
    <label class="time-slot-picker__label">
      <span>Deadline type</span>
      <select v-model="kind" class="time-slot-picker__select" @change="emitValue">
        <option value="exact">Exact time window</option>
        <option value="slot">Time slot (morning / afternoon / …)</option>
      </select>
    </label>
    <label v-if="kind === 'exact'" class="time-slot-picker__label">
      <span>Window (HH:MM-HH:MM)</span>
      <input
        v-model="exactValue"
        type="text"
        class="time-slot-picker__input"
        placeholder="07:00-07:30"
        @input="emitValue"
      />
    </label>
    <label v-else class="time-slot-picker__label">
      <span>Slot</span>
      <select v-model="slotValue" class="time-slot-picker__select" @change="emitValue">
        <option value="morning">morning</option>
        <option value="afternoon">afternoon</option>
        <option value="evening">evening</option>
        <option value="night">night</option>
      </select>
    </label>
  </fieldset>
</template>

<script setup>
import { ref, watch, onMounted } from "vue";

const props = defineProps({
  deadlineType: { type: String, default: "slot" },
  deadlineValue: { type: String, default: "morning" },
});

const emit = defineEmits(["update:deadlineType", "update:deadlineValue"]);

const kind = ref(props.deadlineType);
const exactValue = ref("07:00-08:00");
const slotValue = ref("morning");

function emitValue() {
  emit("update:deadlineType", kind.value);
  if (kind.value === "exact") emit("update:deadlineValue", exactValue.value);
  else emit("update:deadlineValue", slotValue.value);
}

function hydrate() {
  kind.value = props.deadlineType;
  if (props.deadlineType === "exact") exactValue.value = props.deadlineValue || "07:00-08:00";
  else slotValue.value = props.deadlineValue || "morning";
}

onMounted(hydrate);
watch(
  () => [props.deadlineType, props.deadlineValue],
  () => hydrate(),
);
</script>
