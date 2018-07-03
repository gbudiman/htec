class Ms
  def self.sort r:, do_print: false
    take_amount = 1
    while take_amount < r.length
      start = take_amount
      loop do
        merge r: r, take: take_amount, start: start, do_print: do_print
        start = start + 2 * take_amount
        break if start > r.length
      end

      take_amount = take_amount * 2
    end
  end

  def self.merge r:, take:, start:, do_print:
    left = (start-take...maxes(r: r, arg: start)).to_a
    right = (start...maxes(r: r, arg: start+take)).to_a
    #puts "#{left} + #{right}"

    ls = start-take
    le = maxes(r: r, arg: start)
    lit = ls

    rs = start
    re = maxes(r: r, arg: start+take)
    rit = rs

    a = Array.new
    loop do
      #puts "#{lit}/#{le} <> #{rit}/#{re}"
      eleft = r[lit]
      eright = r[rit]

      if eright != nil and eleft < eright
        if lit < le
          a.push eleft
          lit = lit + 1
        else
          a.push eright
          rit = rit + 1
        end
      else
        if (rit < re)
          a.push eright
          rit = rit + 1
        else
          a.push eleft
          lit = lit + 1
        end
      end

      break if lit == le and rit == re 
      if lit > le or rit > re
        raise RuntimeError
      end
    end

    a.each_with_index do |d, i|
      r[start-take + i] = d
    end

    r.print if do_print
  end

  def self.maxes r:, arg:
    return arg > r.length ? r.length : arg
  end
end