class Qs
  def self.sort r:, a:, b:, do_print: false
    end_pos = b
    pivot = r[b]

    (b-1).downto(0).each do |i|
      left = r[i]
      if left > pivot
        push_to_right r: r, pos_start: i, pos_end: end_pos, do_print: do_print
        end_pos = end_pos - 1
      end
    end
    
    sort r: r, a: a, b: end_pos - 1 if a < end_pos - 1
    sort r: r, a: end_pos + 1, b: b if end_pos + 1 < b
  end

  def self.push_to_right r:, pos_start:, pos_end:, do_print:
    buffer = r[pos_start]

    (pos_start+1..pos_end).each do |i|
      r[i - 1] = r[i]
    end

    r[pos_end] = buffer

    r.print if do_print
  end
end